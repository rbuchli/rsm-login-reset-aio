<!DOCTYPE html>
<html class="grey lighten-2" lang="en">

<head>
    <title>Alfresco - ${msg("resetPage.pageTitle")}</title>
    <#--    <comment>-->
    <#--        RSM Switzerland AG-->
    <#--    </comment>-->

    <link rel="stylesheet" type="text/css" href="/share/rsm-login-reset-aio-share/components/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="/share/rsm-login-reset-aio-share/components/main.css">

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
    <script>
        const pwdApp = angular.module("pwdapp", []);
        pwdApp.controller("PasswordController", function ($scope) {

            const strongRegex = new RegExp("^(?=.*[A-Z])((?=.*[\!@#\$&*\(\)\._-])|(?=.*[0-9]))(?=.*[a-z]).{9,40}$");
            const mediumRegex = new RegExp("^(?=.*[A-Z])((?=.*[\!@#\$&*\(\)\._-])|(?=.*[0-9])|(?=.*[a-z])).{9,40}$");
            let strengthresult = false;

            $scope.passwordStrength = {
                "float": "left",
                "width": "200px",
                "height": "25px",
                "margin-left": "5px"
            };

            $scope.analyze = function (value) {
                if (strongRegex.test(value)) {
                    $scope.passwordStrength["background-color"] = "green";
                    strengthresult = true;
                } else if (mediumRegex.test(value)) {
                    $scope.passwordStrength["background-color"] = "orange";
                    strengthresult = true;
                } else {
                    $scope.passwordStrength["background-color"] = "red";
                    strengthresult = false;
                }
            };

        });
    </script>

</head>

<body ng-app="pwdapp">

<#--<header>-->
<#--    <div class="navbar-fixed">-->
<#--        <nav class="grey lighten-4">-->
<#--            <div class="container">-->
<#--                <div class="nav-wrapper">-->
<#--                    <a class="right hide-on-med-and-down grey-text text-darken-4" href="https://files.rsmch.ch">-->
<#--                        Alfresco </a>-->
<#--                </div>-->
<#--            </div>-->
<#--        </nav>-->
<#--    </div>-->
<#--</header>-->

<main>
    <div class="container">

        <div class="row">
            <div class="col s12 m12 l12 text-center">
                <div class="row">
                </div>
                <div class="row">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col l6 offset-l3 s12 m12">
                <div class="card z-depth-1">
                    <div class="card-content">
                        <span class="card-title grey-text text-darken-4"> ${msg("resetPage.title")} </span>
                        <div class="verticalhorizontal">
                            <a href="/share/" class="verticalhorizontal">
                                <img alt="RSM Switzerland AG"
                                     src="/share/rsm-login-reset-aio-share/components/RSMStandardAlfresco.png">
                            </a>
                        </div>
                        <form id="form-reset">
                            <div class="row">
                                <div class="input-field col s12">
                                    <label for="username">${msg("resetPage.usernameLabel")}</label>
                                    <input id="username" name="username" required type="text">
                                </div>
                            </div>
                            <div class="row">
                                <div ng-controller="PasswordController">
                                    <p>${msg("resetPage.newpassLabel")}</p>
                                    <div class="input-field col s12">
                                        <label for="password">
                                            ${msg("resetPage.password")}
                                        </label>
                                        <input id="password" name="password" ng-change="analyze(password)"
                                               ng-model="password" required type="password">
                                    </div>

                                    <div ng-style="passwordStrength" id="pwStrength"></div>

                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <br>
                                    <label for="confirm-password">${msg("resetPage.newpassConfirmLabel")}</label>
                                    <input id="confirm-password" name="confirm-password" required type="password">
                                </div>
                            </div>

                            <#--                            <div class="row"></div>-->
                            <div class="card-action">
                                <button id="form-btn" class="btn waves-effect waves-light disabled" disabled
                                        type="submit">
                                    ${msg("resetPage.submitButton")}
                                </button>
                                <div class="right">
                                    <a href="/share/" class="waves-effect btn grey lighten-5 grey-text text-darken-4"
                                       type="button"
                                       id="action">
                                        ${msg("resetPage.backtologinButton")}
                                    </a>
                                </div>
                            </div>
                        </form>
                        <div id="loading" class="progress blue lighten-1" style="display:none;">
                            <div class="indeterminate blue lighten-4"></div>
                        </div>
                        <div class="text" id="form-result"></div>
                        <div id="error" class="orange-text text-darken-4"></div>
                    </div>
                    <!-- -->
                </div>
            </div>
        </div>

    </div>
</main>

<footer class="page-footer grey lighten-3">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <div class="row valign-wrapper">
                    <div class="col s4 m2">
                        <img class="responsive-img valign"
                             src="/share/rsm-login-reset-aio-share/components/app-logo-48.png" alt="RSM Logo">
                    </div>
                    <div class="col s8 m10">
                        <p class="grey-text text-darken-4">
                            &copy; 2005-2020
                            <a href="http://www.alfresco.com" title="Alfresco" target="_blank">
                                Alfresco Software Inc.
                            </a>
                            | All Rights Reserved.<br>&copy; 2020 RSM Switzerland AG
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="/share/rsm-login-reset-aio-share/components/materialize.min.js"></script>
<script>
    function getErrorMessage(xhr) {
        try {
            let response = JSON.parse(xhr.responseText);
            return response.message;
        } catch (e) {
            return "Does not work. Reason: " + xhr.status;
        }
    }

    $(document).ready(function () {

        let key = getUrlParameter('key');
        let activitiId = getUrlParameter('id');

        let $confirmPassword = $('#confirm-password');

        $('.modal-trigger').leanModal({
            dismissible: true,
            opacity: .5,
            in_duration: 300,
            out_duration: 200,
            complete: function () {
                emptyDiv('#form-result');
            }
        });

        $('#form-reset').submit(function (event) {

            let formBtn = $('#form-btn');

            event.preventDefault();
            emptyDiv('#form-result');
            emptyDiv('#error');
            $('#loading').show();
            //       $('#user option').removeAttr('disabled');
            formBtn.attr('disabled', 'disabled');
            formBtn.removeClass('blue');
            formBtn.addClass('disabled');

            let username = $('#username').val();

//            let email = people.getPerson(username).getEmail();
//            let user = com.activiti.security.SecurityUtils.getCurrentUserObject();
//            let username = user.getUserName;
            let pwd = $('#password').val();
            $.ajax({
                type: "POST",
                url: "/alfresco/api/-default-/public/alfresco/versions/1/people/" + username + "/reset-password",
                data: JSON.stringify({password: pwd, id: activitiId, key: key}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    $('#loading').hide();
                    //       $('#user option').attr('disabled', 'disabled');
                    $('#form-result').text('${msg("resetPage.passwordUpdated")}');
                },
                error: function (xhr, status, error) {
                    $('#loading').hide();
                    //       $('#user option').attr('disabled', 'disabled');
                    formBtn.removeAttr('disabled');
                    formBtn.addClass('blue');
                    formBtn.removeClass('disabled');
                    $('#error').text(getErrorMessage(xhr));
                }
            });
        });

        function checkPass() {


            let pwd = $('#password').val();
            let pwd2 = $confirmPassword.val();
            let strengthField = document.getElementById('pwStrength');
            let formBtn = $('#form-btn');

            //if (!$('#username').is(':disabled')) {
            if ((pwd === pwd2) && strengthField.style.backgroundColor !== "red") {
                emptyDiv('#error');
                formBtn.addClass('blue');
                formBtn.removeClass('disabled');
                formBtn.removeAttr('disabled');
            } else {
                formBtn.attr('disabled', 'disabled');
                formBtn.removeClass('blue');
                formBtn.addClass('disabled');
                $('#error').text('${msg("resetPage.passwordMismatch")}');
            }
            //}
        }

        $confirmPassword.keyup(function () {
            checkPass();
            return false;
        });

        function emptyDiv(divElement) {
            $(divElement).empty();
        }

        function getUrlParameter(sParam) {
            let sPageURL = window.location.search.substring(1);
            let sURLVariables = sPageURL.split('&');
            for (let i = 0; i < sURLVariables.length; i++) {
                let sParameterName = sURLVariables[i].split('=');
                if (sParameterName[0] === sParam) {
                    return sParameterName[1];
                }
            }
        }

    });
</script>

</body>

</html>