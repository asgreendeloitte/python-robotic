import sys
import requests


def get_input_parameters():
    """
    Read the parameters provided when the script os executed by the CI/CD pipeline
    :return:
    """
    if len(sys.argv) != 4:
        print("[ERROR] Invalid number of arguments. Expected 3, provided " + str(len(sys.argv[1:])))

    token = str(sys.argv[1])
    test_result = int(sys.argv[2])
    one_click_test_id = int(sys.argv[3])

    return token, test_result, one_click_test_id


def http_post(endpoint, headers, body):
    """
    Performs a HTTP Post request and returns the response
    :param endpoint: the endpoint to be used in the HTTP POST request
    :param headers: HTTP headers to be included in the HTTP POST requests
    :param body: payload to be included the the HTTP POST request
    :return: HTTP Response
    """
    try:
        response = requests.post(endpoint, headers=headers, json=body)
    except requests.exceptions.HTTPError as errh:
        print("HTTP Error:", errh)
    except requests.exceptions.ConnectionError as errc:
        print("Error Connecting:", errc)
    except requests.exceptions.Timeout as errt:
        print("Timeout Error:", errt)
    except requests.exceptions.RequestException as err:
        print("HTTP Response Error", err)

    return response


def update_test_result(test_result, test_id, qap_access_token):
    """
    :param test_result: 1 - tests passed / 2 - tests failed
    :param test_id: QA Portal test id of the test status that we want to update
    :param qap_access_token: QA Portal access token
    :return:
    """
    update_test_result_endpoint = "https://api.qap-ukhsa.uk/api/OneClickRun/SetOneClickResult/%s" % test_id

    # create Change Request body
    create_test_body = {
        "status": test_result
    }

    headers = {
        "Authorization": "Bearer " + qap_access_token,
        "Accept": "application/json",
        "Content-Type": "application/json"
    }

    response = http_post(update_test_result_endpoint, headers, create_test_body)

    if response.status_code == 200:
        print("[SUCCESS] The result of the test %s was updated to %s " % (test_id, test_result))
    else:
        print("[ERROR] HTTP STATUS CODE " + str(response.status_code) + ": " + dict(response.json()).get("message"))
        sys.exit(1)

    return response


def main():
    qap_token, test_result, one_click_test_id = get_input_parameters()
    update_test_result_response = update_test_result(test_result, one_click_test_id, qap_token)
    return update_test_result_response


if __name__ == "__main__":
    main()