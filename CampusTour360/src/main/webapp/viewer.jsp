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

        <div id="panorama"></div>
        <script>
            pannellum.viewer('panorama', {
                "type": "equirectangular",
                "panorama": "${imagePath}", // Java injects the image path here!
                "autoLoad": true,
                "compass": true,
                "hotSpots": [
                    {
                        "pitch": 0,
                        "yaw": 110,
                        "type": "info",
                        "text": "Go to next area",
                        // Java injects the next ID here so the arrow works!
                        "URL": "tour?id=${nextId}"
                    }
                ]
            });
        </script>
    </body>
</html>