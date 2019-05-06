const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    const items = [
        "I'm so happy I have you as my best friend, and I love Lisa so much",
        "It’s bullshit, I did not hit her. I did nooot. Oh hi, Mark!",
        "Why, Lisa, why, WHY?!",
        "Johnny’s my best friend!",
        "Anyway, how’s your sex life?",
        "You’re tearing me apart, Lisa!",
        "I got the results of the test back. I definitely have breast cancer.",
        "Hi doggy!",
        "You're my favourite customer.",
        "Everybody betrayed me! I’m fed up with this world",
        "In a few minutes, bitch.",
        "Chicken, Peter, you’re just a little chicken. Cheep, cheep, cheep, cheep, cheep!",
        "Leave your stupid comments in your pocket!",
        "Let’s go eat, huh?"
    ]
    const item = items[Math.floor(Math.random()*items.length)]
    return res.send(`Tommy says: ${item}`)
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))