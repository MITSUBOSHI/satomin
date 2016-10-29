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
  "https://drive.google.com/file/d/0B8TFgKtyNaHMbWgtWDRDcW1OUEU/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMNVFoWERrb0ROY1U/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMVGRuampiXzg3NkE/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMZC1SMjJ6WGRDczQ/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMUXQ2NlNZTy1KWnM/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMRUhSZHRrcXZiUzA/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMV0l1QTNSem5aLXM/view?usp=sharing",
  "https://drive.google.com/file/d/0B8TFgKtyNaHMZEtqTjdpTFJjWmc/view?usp=sharing"
]


module.exports = (robot) ->

  robot.hear /(おはよ.|hello|good( [d'])?ay(e)?)/i, (msg) ->
    hello = msg.random hellos
    msg.send "#{msg.message.user.name}、#{hello}"

  robot.hear /(godzila|ゴジラ)/i, (msg) ->
    timestamp = (new Date()).toISOString().replace(/[^0-9]/g, "")
    msg.send "ガッジーラ", "https://drive.google.com/file/d/0B8TFgKtyNaHMRWlMRWV6emlId3M/view?usp=sharing?#{timestamp}"

  robot.hear /(疲れた|つかれた)/i, (msg) ->
    msg.send "#{msg.message.user.name}、お疲れさま！"

  robot.hear /(いやし|癒し|heal me)/i, (msg) ->
    heal_word = msg.random heal_words
    heal_img = msg.random heal_imgs
    msg.send heal_word, heal_img
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
