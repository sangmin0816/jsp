<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
<style>
    #map {width:1200px; height:600px; position:relative; margin:20px auto 200px !important;overflow:hidden;}
</style>

<div class="wrap web guide" data-page_section="web" data-page_type="guide" data-title="Daum 지도 Web API 가이드">
    <div  class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="maparea">
                    <div id="map" style="margin-left:120px;	margin-top:50px; width:800px;height:600px; background:white; "></div>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.4786713,126.8864968), // 지도의 중심좌표
                                level: 2 // 지도의 확대 레벨
                            };
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        // 마커가 표시될 위치입니다
                        var markerPosition  = new daum.maps.LatLng(37.4786713,126.8864968);
                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            position: markerPosition
                        });
                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">마리오아울렛2관<br><a href="" style="color:blue;" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new daum.maps.LatLng(37.4786713,126.8864968); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new daum.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });
                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    </script>
                    <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                    <script type="text/javascript">
                        var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                        window._tiq = _tiq;
                        _tiq.push(['__trackPageview']);
                    </script>
                    <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                    </script>
                </div>
            </div>
        </section>
    </div>
</div>