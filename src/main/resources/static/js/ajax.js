/**
 * Default redirect in case of fail verification.
 * @type {string}
 */
const DEFAULT_FAIL_REDIRECT = '/login';

/**
 * Default redirect in case of successful logging.
 * @type {string}
 */
const DEFAULT_SUCCESSFUL_REDIRECT = '/home';

/**
 * Register user and redirects to a {@link DEFAULT_FAIL_REDIRECT}.
 * @param userData{object} - users data
 * @param errorHandler{function(object)} - error handler
 */
function ajaxRegistration(userData, errorHandler) {
    $.ajax({
        type: 'POST',
        url: '/api/user/register',
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify(userData),
        success: function (data, textStatus, jqXHR) {
            const userURI = jqXHR.getResponseHeader("Location");
            console.log('Accepted User URI:', userURI);
            localStorage.setItem('userURI', userURI);
            window.location.replace(DEFAULT_FAIL_REDIRECT);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            errorHandler(jqXHR.responseJSON);
        }
    })
}

/**
 * Logged user and redirects to a {@link DEFAULT_SUCCESSFUL_REDIRECT}.
 * @param login{string} - user login
 * @param password{string} - user password
 * @param errorHandler{function(object)} - error handler
 */
function ajaxLogin(login, password, errorHandler) {
    let redirect = localStorage.getItem('redirect');
    if (redirect === null) {
        redirect = DEFAULT_SUCCESSFUL_REDIRECT;
    }

    $.ajax({
        type: 'GET',
        url: '/api/user/login',
        data: {login: login, password: password},
        dataType: 'json',
        success: function (data, textStatus, jqXHR) {
            const token = data.tokenType + ' ' + data.accessToken;
            const userURI = data.user.userURI;
            const userID = data.user.login;

            console.log('Accepted Token:', token);
            localStorage.setItem('token', token);
            localStorage.setItem('userURI', userURI);
            localStorage.setItem('userID', userID);
            localStorage.removeItem('redirect');
            window.location.replace(redirect);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            errorHandler(jqXHR.responseJSON);
        }
    })
}

/**
 * Logging and getting user data by storied token and userURI.
 *
 * @param {string} securedURL - requested secured URL
 * @param {function(object)} successEvent - function that is called in case of successful verification.
 * @param errorHandler{function(object)} - error handler
 */
function ajaxVerify(securedURL, successEvent, errorHandler) {
    const token = localStorage.getItem('token');
    if ((token === null) || (securedURL === null)) {
        localStorage.setItem('redirect', window.location.href);
        window.location.replace(DEFAULT_FAIL_REDIRECT);
    } else {
        $.ajax({
            type: 'GET',
            url: securedURL,
            dataType: 'json',
            beforeSend: function (jqXHR, settings) {
                console.log('Setting the Authorization Header:', token);
                jqXHR.setRequestHeader('Authorization', token);
            },
            success: function (data, textStatus, jqXHR) {
                console.log('Accepted Data:', data);
                successEvent(data)
            },
            error: function (jqXHR, textStatus, errorThrown) {
                errorHandler(jqXHR.responseJSON);
            }
        })
    }
}

/**
 * Logout user.
 */
function ajaxLogout() {
    localStorage.clear();
    window.location.replace(DEFAULT_FAIL_REDIRECT);
}
