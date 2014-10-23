# http://icondecotter.jp/blog/2013/03/02/canvas-drawimag%E3%81%A7%E8%B2%BC%E3%82%8A%E4%BB%98%E3%81%91%E3%82%8B%E7%94%BB%E5%83%8F%E3%82%92%E5%9B%9E%E8%BB%A2%E3%81%95%E3%81%9B%E3%82%8B/
$ ->
  canvasElement = $ '#canvas'
  canvas = canvasElement[0]
  ctx = canvas.getContext '2d'

  loading = $ '#loading'

  rotate = [90, 180, 270, 360]
  count = 0

  SIZE = 200

  rotateImage = () ->
    loading.html '通信中...'

    count = 0  if count > 3
    rad = rotate[count++] * Math.PI / 180

    ctx.clearRect(0, 0, SIZE, SIZE)
    ctx.save()
    #  ctx.rotate 90 * Math.PI / 180
    ctx.setTransform Math.cos(rad), Math.sin(rad), -Math.sin(rad), Math.cos(rad), SIZE/2, SIZE/2
    ctx.translate -1 * SIZE/2, -1 * SIZE/2
    ctx.drawImage img, 0, 0
    ctx.restore()

    data = canvas.toDataURL('image/jpeg')

    $.post('upload.php', {image: data}).done(() ->
      console.log 'done'
      loading.html '完了'
    )

  $('#rotate').on 'click', (e) ->
    e.preventDefault()

    rotateImage()

  img = new Image()
  img.onload = () ->
    ctx.drawImage img, 0, 0
  img.src = 'hisasann.jpeg'

