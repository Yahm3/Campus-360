<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Campus Tour - ${locationName}</title>
        <link rel="stylesheet" href="css/viewer.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.css"/>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.js"></script>
        <script src="javascript/viewer.js"></script>
    </head>
    <body>

        <header>
            <h2>Currently viewing: ${locationName}</h2>
        </header>

        <div id="panorama" style="width:100%; height:100vh;"></div>

        <script>
            pannellum.viewer('panorama', {
                "type": "equirectangular",
                "panorama": "${imagePath}",
                "autoLoad": true,
                "compass": true,
                "hotSpotDebug": true,
                "hotSpots": [
                    {
                        "pitch": 0,
                        "yaw": 110,
                        "type": "info",
                        "text": "Go to next area",
                        "URL": "tour?id=${nextId}"
                    },
                    {
                        "pitch": 1.98,
                        "yaw": 97.16,
                        "type": "info",
                        "text": "Go to next area",
                        "URL": "tour?id=${nextId}"
                    }
                ]
            });
        </script>
    </body>
</html>