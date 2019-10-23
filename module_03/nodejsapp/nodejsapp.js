const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))
app.get('/theroom', (req,res) => res.send('<iframe width="560" height="315" src="https://www.youtube.com/embed/Jv3MhjSmR3c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'))
app.get('/troll2', (req, res) => res.send('<html><iframe width="560" height="315" src="https://www.youtube.com/embed/HyophYBP_w4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></html>'))
app.get('/nickcage', (req, res) => res.send('<html><iframe width="560" height="315" src="https://www.youtube.com/embed/EVCrmXW6-Pk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></html>'))
app.get('/samuraicop', (req, res) => res.send('<html><iframe width="560" height="315" src="https://www.youtube.com/embed/kWKCe4JNxdA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></html>'))
app.get('/toughguys', (req, res) => res.send('<html><iframe width="560" height="315" src="https://www.youtube.com/embed/Y9KyBdPeKHg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></html>'))

module.exports = app