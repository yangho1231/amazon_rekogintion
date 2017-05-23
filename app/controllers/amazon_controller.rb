require 'open-uri'
class AmazonController < ApplicationController
    rekognition = Aws::Rekognition::Client.new(region: 'us-west-2')
      imageUrl = "https://developer.clarifai.com/static/images/model-samples/general-001.jpg"

      image = open(imageUrl)
      resp = rekognition.detect_labels({
        image: {
          bytes: image
        },
        max_labels: 10,
        min_confidence: 10
      })

        puts resp.labels.to_json, "testings"    
end
