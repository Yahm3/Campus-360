<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Campus Tour - ${locationName}</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.css"/>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.js"></script>
    
    <style>
        body { margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #f4f4f4;}
        header { background: #333; color: white; padding: 15px; text-align: center; }
        
        /* Make the 360 viewer fill most of the screen */
        #panorama { 
            width: 100vw; 
            height: 85vh; 
        }
    </style>
</head>
<body>

    <header>
        <h2>Currently viewing: ${locationName}</h2>
    </header>

    <div id="panorama"></div>

    <script>
    // Initialize the Pannellum viewer
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