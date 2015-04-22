/**
 * Created by david on 21/04/2015.
 */
angular.module('starter', [])

    .controller('ChatCtrl', function($scope){
        
        $scope.username = "";
        $scope.message = "";

        $scope.messages = [
            {
                who: "Dummy1",
                message: "My first message",
                date: 1
            },
            {
                who: "Dummy2",
                message: "Oh well, fuck u 2",
                date: 2
            }];
        
        $scope.newMessages = [ ];
        
        $scope.socket = new SockJS('/wsapp/say');
        $scope.stompClient = Stomp.over($scope.socket);
        $scope.stompClient.connect({}, function(frame){
            console.log('Connected: ' + frame);
            $scope.stompClient.subscribe('/topic/said', $scope.appendToChat)
        });
        
        $scope.appendToChat = function(calResult){
            $scope.$apply(function(){
                $scope.newMessages.push(JSON.parse(calResult.body));
            });
        };
                
        $scope.sendMessage = function(){
            $scope.stompClient.send("/wsapp/say", {}, JSON.stringify(
                { 
                    'who': $scope.username,
                    'message': $scope.message,
                    'date': new Date().getTime()
                }));
            $scope.message = "";
        };
        
        $scope.flushMessages = function(){
            $scope.messages = $scope.messages.concat($scope.newMessages);
            $scope.newMessages = [ ];
            var height = document.getElementsByClassName("log-box")[0].scrollHeight;
            $('.log-box').animate({scrollTop: height});
        };
    });