cronJob = require('cron').CronJob

module.exports = (robot) ->

  send = (channel, msg) ->
    robot.send {room: channel}, msg

  new cronJob('0 30 09 * * 1-5', () ->
    send '#general', "@here おはよっ！今日も1日楽しもうね！"
  ).start()

  new cronJob('0 30 18 * * 1-5', () ->
    send '#general', "@here 早く仕事終えて、私と遊ぼうよ"
  ).start()

  new cronJob('0 00 13 * * 1-5', () ->
    send '#general', "@here そろそろご飯にしない？"
  ).start()

  new cronJob('0 00 22 * * 1-5', () ->
    send '#general', "@here ふあ、そろそろ寝たいなあ。。。"
  ).start()
