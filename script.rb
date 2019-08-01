require 'google/cloud/speech'

# https://googleapis.dev/ruby/google-cloud-speech/latest/Google/Cloud/Speech/V1/SpeechClient.html#long_running_recognize-instance_method
# https://cloud.google.com/speech-to-text/docs/reference/libraries?hl=ja#client-libraries-install-ruby

speech_client = Google::Cloud::Speech.new(version: :v1)
encoding = :FLAC
sample_rate_hertz = 44100
language_code = 'ja-JP'
config = {
  encoding: encoding,
  sample_rate_hertz: sample_rate_hertz,
  language_code: language_code
}

# raw_audio = File.binread ARGV[0]
audio = { uri: ARGV[0] }

# Register a callback during the method call.
operation = speech_client.long_running_recognize(config, audio)

# Or use the return value to register a callback.
operation.on_done do |op|
  raise op.results.message if op.error?

  File.open("transcript-#{Time.now.to_i}.txt", 'w') do |f|
    op.results.results.each do |result|
      result.alternatives.each do |alt|
        f.puts alt&.transcript
      end
    end
  end
end

operation.wait_until_done!
