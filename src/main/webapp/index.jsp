<!--<!DOCTYPE html>-->
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WsApp</title>
    
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">

    <script src="//cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
    <script src="resources/js/stomp.min.js"></script>
    
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

    <script src="resources/js/angular.min.js"></script>
    
    <script src="resources/js/app.js"></script>
    
</head>
<body ng-app="starter">

    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <div class="chat" ng-controller="ChatCtrl">
                <div class="log-box">
                    <p class="message"><strong>System</strong>: Welcome to the chatgle!</p>
                    <p class="message" ng-repeat="message in messages | orderBy: '+date'">
                        <strong>{{message.date | date: '[HH:mm]'}}{{message.who}}</strong>: {{message.message}}
                    </p>
                </div>
                <div class="message-box">
                    <form ng-submit="sendMessage()" class="form-inline">
                        <div class="form-group">
                            <div class="input-group">
                                <input ng-model="username" class="form-control" placeholder="User" required/>
                                <div class="input-group-addon">&nbsp;</div>
                                <input ng-model="message" class="form-control" placeholder="Say anything" required/>
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="submit">Send!</button>
                                </span>
                            </div>
                        </div>
                    </form>
                    <div class="notification">
                        <button class="btn btn-success" ng-click="flushMessages()" ng-hide="newMessages.length == 0">{{newMessages.length}} new messages</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>