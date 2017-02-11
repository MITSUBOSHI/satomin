# Description:
#   Satomin bot makes you happy
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

hellos = [
  "おはよ",
  "やっほ",
  "モーニング"
]

heal_words = [
  "もう、しょうがないんだからあ",
  "そんなに欲しい？",
  "これで癒されてね!!",
  "ふぁいと!!"
]

heal_imgs = [
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMbWgtWDRDcW1OUEU",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMNVFoWERrb0ROY1U",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMVGRuampiXzg3NkE",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMZC1SMjJ6WGRDczQ",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMUXQ2NlNZTy1KWnM",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMRUhSZHRrcXZiUzA",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMV0l1QTNSem5aLXM",
  "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMZEtqTjdpTFJjWmc"
]

module.exports = (robot) ->

  robot.hear /(おはよ.*|hello|good( [d'])?ay(e)?)/i, (msg) ->
    hello = msg.random hellos
    msg.send "#{msg.message.user.name}、#{hello}"

  robot.hear /(godzila|ゴジラ)/i, (msg) ->
    timestamp = (new Date()).toISOString().replace(/[^0-9]/g, "")
    msg.send "ガッジーラ", "http://drive.google.com/uc?export=view&id=0B8TFgKtyNaHMRWlMRWV6emlId3M&time=#{timestamp}"

  robot.hear /(疲れた|つかれた)/, (msg) ->
    msg.send "#{msg.message.user.name}、お疲れさま！"

  robot.hear /(いやし|癒|heal me)/i, (msg) ->
    timestamp = (new Date()).toISOString().replace(/[^0-9]/g, "")
    heal_word = msg.random heal_words
    heal_img = msg.random heal_imgs
    heal_img = "#{heal_img}&time=#{timestamp}"
    msg.send heal_word, heal_img

  robot.hear /(コードレビュー|code.*\sreview)/, (msg) ->
    msg.send "F**king damn codesね"

  robot.hear /人工無脳/, (msg) ->
    msg.send "あ、ただの無能みーつけたっ！"

  robot.hear /卍解/, (msg) ->
    msg.send "チャドの霊圧が・・・消えた・・・？"

  robot.hear /^片手に$/, (msg) ->
    msg.send "ピストル"

  robot.hear /^心に$/, (msg) ->
    msg.send "花束"

  robot.hear /^唇に$/, (msg) ->
    msg.send "火の酒"

  robot.hear /^背中に$/, (msg) ->
    msg.send "人生を"

  robot.hear /(チョコレイト|チョコレート)/, (msg) ->
    msg.send "ディスコ！！"

  robot.hear /^check_ip_regexp/i, (msg) ->
    msg.send "Give me IP Regexp!"
    # msg.send 'e.g.) ^122\.104\.1[0-2][0-9]\.1[0-9]$|^123\.123\.123\.123$'
    robot.hear /.*\\\..*/, (msg) ->
      target_ip_regexp = "#{msg.message}"
      msg.send "Give me IP parts!"
      robot.hear /^\d{1,3}(\.\d{1,3}){0,3}$/, (msg) ->
        target_ip_parts = "#{msg.message}"
        @exec = require('child_process').exec
        #command = "echo '#{target_ip_parts}' | xargs -n1 -P2 ./scripts/go/ip_checker_practice '#{target_ip_regexp}'"
        command =  ["./scripts/go/ip_checker_practice", "#{target_ip_regexp}", "#{target_ip_parts}"].join(" ")
        msg.send "Command: #{command}"
        @exec command, (error, stdout, stderr) ->
          msg.send error if error?
          msg.send stdout if stdout?
          msg.send stderr if stderr?
  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
