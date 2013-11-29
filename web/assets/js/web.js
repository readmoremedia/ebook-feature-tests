$(document).ready(function () {
    var fontSize = 100,
        minFontSize = 50,
        maxFontSize = 300,
        stepFontSize = 10,
        featureSet = $('#featureset'),
        decreaseFontSize = $('#font-smaller'),
        increaseFontSize = $('#font-larger');


    decreaseFontSize.click(function () {
        if (fontSize > minFontSize) {
            fontSize = fontSize - stepFontSize;
            featureSet.css('font-size', fontSize + '%');
        }
    });

    increaseFontSize.click(function () {
        if (fontSize < maxFontSize) {
            fontSize = fontSize + stepFontSize;
            featureSet.css('font-size', fontSize + '%');
        }
    });
});
