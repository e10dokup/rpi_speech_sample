require 'net/http'
require 'uri'

API_KEY = 'your_api_key'

class Speech
  def do_speech(text)

    endpoint = URI.parse('https://api.apigw.smt.docomo.ne.jp/voiceText/v1/textToSpeech')
    endpoint.query = 'APIKEY=' + API_KEY

    request_body = {
        'text'=>text,
        'speaker'=>'hikari',
        'emotion'=>'anger'
    }

    res = Net::HTTP.post_form(endpoint, request_body)

    case res
      when Net::HTTPSuccess
        file_name = "voice.wav"
        File.binwrite(file_name, res.body)
        `aplay voice.wav`
        File.delete(file_name)
      else
        res.value
    end
  end
end