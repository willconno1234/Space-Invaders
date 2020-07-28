WINDOW_WIDTH = love.graphics.getWidth()
WINDOW_HEIGHT = love.graphics.getHeight()

bullets = {}
bullets1 = {}
bullets2 = {}
bullets3 = {}
bullets4 = {}
bullets5 = {}
bullets6 = {}
bullets7 = {}
bullets8 = {}
bullets9 = {}
bullets10 = {}
bullets11 = {}
bullets12 = {}

player ={}
enemy1 ={}
enemy2 ={}
enemy3 ={}
enemy4 ={}
enemy5 ={}
enemy6 ={}
enemy7 ={}
enemy8 ={}
enemy9 ={}
enemy10 = {}
enemy11 = {}
enemy12= {}

gameState = 'start'

enemy_timer = 0

enemy1_timer = 0
enemy2_timer = 0
enemy3_timer = 0
enemy4_timer = 0
enemy5_timer = 0
enemy6_timer = 0
enemy7_timer = 0
enemy8_timer = 0
enemy9_timer = 0
enemy10_timer = 0
enemy11_timer = 0
enemy12_timer = 0

enemy_gap = 20
enemy_gap_y = 20

shot_fire = 0


player.x = WINDOW_WIDTH / 2 - 25
player.y = 500
player.dx = 300
player.width = 50
player.height = 32
player.heat = 0
player.heatp = 0.5
player.health = 3
player.death = false
player.time = 0

invaders_image = love.graphics.newImage('graphics/invaders.png')
--http://pluspng.com/space-invaders-png-9885.html
explosion_image = love.graphics.newImage('graphics/explosion.png')
--https://wiki.computationalthinkingfoundation.org/wiki/File:SpaceInvadersAlienExplosionDepiction.png
player_image = love.graphics.newImage('graphics/ship4.png')
--https://ya-webdesign.com/image/transparent-sprite-space-invaders/1524708.html
player_heart = love.graphics.newImage('graphics/heart5.png')
--https://www.hiclipart.com/free-transparent-background-png-clipart-dwwpw


enemy1.x = 10
enemy1.y =  10
enemy1.width = 50
enemy1.height = 50
enemy1.health = 100
enemy1.heat = 0
enemy1.heatp = 0.5
enemy1.death = 0
enemy1.death = false
enemy1.time = 0

enemy2.x = 70 + enemy_gap
enemy2.y =  10
enemy2.width = 50
enemy2.height = 50
enemy2.health = 100
enemy2.heat = 0
enemy2.heatp = 0.5
enemy2.death = false
enemy2.time = 0

enemy3.x = 130 + enemy_gap * 2
enemy3.y =  10
enemy3.width = 50
enemy3.height = 50
enemy3.health = 100
enemy3.heat = 0
enemy3.heatp = 0.5
enemy3.death = false
enemy3.time = 0

enemy4.x = 10
enemy4.y =  70 + enemy_gap_y
enemy4.width = 50
enemy4.height = 50
enemy4.health = 100
enemy4.heat = 0
enemy4.heatp = 0.5
enemy4.death = false
enemy4.time = 0

enemy5.x = 70 + enemy_gap
enemy5.y =  70 + enemy_gap_y
enemy5.width = 50
enemy5.height = 50
enemy5.health = 100
enemy5.heat = 0
enemy5.heatp = 0.5
enemy5.death = false
enemy5.time = 0

enemy6.x = 130 + enemy_gap * 2
enemy6.y =  70 + enemy_gap_y
enemy6.width = 50
enemy6.height = 50
enemy6.health = 100
enemy6.heat = 0
enemy6.heatp = 0.5
enemy6.death = false
enemy6.time = 0

enemy7.x = 10
enemy7.y =  130 + enemy_gap_y * 2
enemy7.width = 50
enemy7.height = 50
enemy7.health = 100
enemy7.heat = 0
enemy7.heatp = 0.5
enemy7.death = false
enemy7.time = 0

enemy8.x = 70 + enemy_gap
enemy8.y =  130 + enemy_gap_y * 2
enemy8.width = 50
enemy8.height = 50
enemy8.health = 100
enemy8.heat = 0
enemy8.heatp = 0.5
enemy8.death = false
enemy8.time = 0

enemy9.x = 130 + enemy_gap * 2
enemy9.y =  130 + enemy_gap_y * 2
enemy9.width = 50
enemy9.height = 50
enemy9.health = 100
enemy9.heat = 0
enemy9.heatp = 0.5
enemy9.death = false
enemy9.time = 0

enemy10.x = 190 + enemy_gap * 3
enemy10.y =  10
enemy10.width = 50
enemy10.height = 50
enemy10.health = 100
enemy10.heat = 0
enemy10.heatp = 0.5
enemy10.death = false
enemy10.time = 0

enemy11.x = 190 + enemy_gap * 3
enemy11.y =  70 +enemy_gap_y
enemy11.width = 50
enemy11.height = 50
enemy11.health = 100
enemy11.heat = 0
enemy11.heatp = 0.5
enemy11.death = false
enemy11.time = 0

enemy12.x = 190 + enemy_gap * 3
enemy12.y =  130 +enemy_gap_y * 2
enemy12.width = 50
enemy12.height = 50
enemy12.health = 100
enemy12.heat = 0
enemy12.heatp = 0.5
enemy12.death = false
enemy12.time = 0

bullets.x = player.x + 25
bullets.y = 540
bullets.dy = -200
bullets.width = 2
bullets.height = 10

sounds = {['player_shoot'] = love.audio.newSource('sounds/shoot1.wav', 'static'), ['enemy_shoot'] = love.audio.newSource('sounds/shoot3.wav', 'static'), ['explosion'] = love.audio.newSource('sounds/explosion3.wav', 'static'), ['hit'] = love.audio.newSource('sounds/hit.wav', 'static')
}


enemy_movement = 1

function love.load()
    smallFont = love.graphics.newFont('font2.ttf', 16)
    largeFont = love.graphics.newFont('font2.ttf', 32)
    --https://www.dafont.com/mtheme.php?id=5
    love.window.setTitle('Space Invaders')  
end

function love.keypressed(key)

    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        gameState = 'play'
    end

    if gameState == 'play' then
        if key == 'space' then
            shot_fire = shot_fire + 1
        end
    end

end

function love.draw()
    
    love.graphics.setColor(255, 255, 255, 224)
    love.graphics.setFont(smallFont)
	for i, o in ipairs(bullets) do
		love.graphics.circle('fill', o.x, o.y, 5, 4)
    end

    for i, a in ipairs(bullets1) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end

    for i, a in ipairs(bullets2) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end

    for i, a in ipairs(bullets3) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end

    for i, a in ipairs(bullets4) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end

    for i, a in ipairs(bullets5) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets6) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets7) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets8) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets9) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets10) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets11) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    for i, a in ipairs(bullets12) do
		love.graphics.circle('fill', a.x, a.y, 5, 4)
    end
    
    if player.health > 0 then
        love.graphics.draw(player_image, player.x, player.y)
    elseif player.health <= 0 and player.death == true then
        love.graphics.draw(explosion_image, player.x, player.y)
        sounds['explosion']:play()
    end
    

    if enemy1.health > 0 then
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(invaders_image, enemy1.x, enemy1.y)
    elseif enemy1.health <= 0 and enemy1.death == true then
        love.graphics.draw(explosion_image, enemy1.x, enemy1.y)
        sounds['explosion']:play()
        end
    if enemy2.health > 0 then
        love.graphics.draw(invaders_image, enemy2.x, enemy2.y)
    elseif enemy2.health <= 0 and enemy2.death == true then
        love.graphics.draw(explosion_image, enemy2.x, enemy2.y)
        sounds['explosion']:play()
    end

    if enemy3.health > 0 then
        love.graphics.draw(invaders_image, enemy3.x, enemy3.y)
    elseif enemy3.health <= 0 and enemy3.death == true then
        love.graphics.draw(explosion_image, enemy3.x, enemy3.y)
        sounds['explosion']:play()
    end
    if enemy4.health > 0 then
        love.graphics.draw(invaders_image, enemy4.x, enemy4.y)
    elseif enemy4.health <= 0 and enemy4.death == true then
        love.graphics.draw(explosion_image, enemy4.x, enemy4.y)
        sounds['explosion']:play()
    end
    if enemy5.health > 0 then
        love.graphics.draw(invaders_image, enemy5.x, enemy5.y)
    elseif enemy5.health <= 0 and enemy5.death == true then
        love.graphics.draw(explosion_image, enemy5.x, enemy5.y)
        sounds['explosion']:play()
    end
    if enemy6.health > 0 then
        love.graphics.draw(invaders_image, enemy6.x, enemy6.y)
    elseif enemy6.health <= 0 and enemy6.death == true then
        love.graphics.draw(explosion_image, enemy6.x, enemy6.y)
        sounds['explosion']:play()
    end
    if enemy7.health > 0 then
        love.graphics.draw(invaders_image, enemy7.x, enemy7.y)
    elseif enemy7.health <= 0 and enemy7.death == true then
        love.graphics.draw(explosion_image, enemy7.x, enemy7.y)
        sounds['explosion']:play()
    end
    if enemy8.health > 0 then
        love.graphics.draw(invaders_image, enemy8.x, enemy8.y)
    elseif enemy8.health <= 0 and enemy8.death == true then
        love.graphics.draw(explosion_image, enemy8.x, enemy8.y)
        sounds['explosion']:play()
    end
    if enemy9.health > 0 then
        love.graphics.draw(invaders_image, enemy9.x, enemy9.y)
    elseif enemy9.health <= 0 and enemy9.death == true then
        love.graphics.draw(explosion_image, enemy9.x, enemy9.y)
        sounds['explosion']:play()
    end
    if enemy10.health > 0 then
        love.graphics.draw(invaders_image, enemy10.x, enemy10.y)
    elseif enemy10.health <= 0 and enemy10.death == true then
        love.graphics.draw(explosion_image, enemy10.x, enemy10.y)
        sounds['explosion']:play()
    end
    if enemy11.health > 0 then
        love.graphics.draw(invaders_image, enemy11.x, enemy11.y)
    elseif enemy11.health <= 0 and enemy11.death == true then
        love.graphics.draw(explosion_image, enemy11.x, enemy11.y)
        sounds['explosion']:play()
    end
    if enemy12.health > 0 then
        love.graphics.draw(invaders_image, enemy12.x, enemy12.y)
    elseif enemy12.health <= 0 and enemy12.death == true then
        love.graphics.draw(explosion_image, enemy12.x, enemy12.y)
        sounds['explosion']:play()
    end

    if gameState == 'start' then
        love.graphics.printf('Welcome to Space Invaders', 0, 300, 800, 'center')
        love.graphics.printf('press enter to start!', 0, 330, 800, 'center')
    elseif gameState == 'victory' then
        love.graphics.setFont(largeFont)
        love.graphics.printf('Victory!', 0, 300, 800, 'center')
        love.graphics.setFont(smallFont)
    elseif gameState == 'defeat' then
        love.graphics.setFont(largeFont)
        love.graphics.printf('Defeat', 0, 300, 800, 'center')
        love.graphics.setFont(smallFont)
    end

    
    
    love.graphics.print('lives:', 10 , 565)
    if player.health >= 1 then 
        love.graphics.draw(player_heart, 50, 562)
    end
    
    if player.health >= 2 then 
        love.graphics.draw(player_heart, 80, 562)
    end

    if player.health >= 3 then 
        love.graphics.draw(player_heart, 110, 562)
    end
    


    displayFPS()
end

function love.update( dt )


enemy_total_health = enemy1.health + enemy2.health + enemy3.health + enemy4.health + enemy5.health + enemy6.health + enemy7.health + enemy8.health + enemy9.health + enemy10.health + enemy11.health + enemy12.health

    if love.keyboard.isDown('space') and player.heat <= 0 and gameState == 'play' then
		local direction = math.atan2(-1 , 0)
		table.insert(bullets, {
			x = player.x + player.width / 2,
			y = player.y,
			dir = direction,
			speed = 400
		})
        player.heat = player.heatp
        sounds['player_shoot']:play()
    end
    
    if enemy2.health <= 0 then
        enemy2.time = enemy2.time + dt
        if enemy2.time < 0.5 then
            enemy2.death = true
        else
            enemy2.death = false
        end
    end

    if enemy1.health <= 0 then
        enemy1.time = enemy1.time + dt
        if enemy1.time < 0.5 then
            enemy1.death = true
        else
            enemy1.death = false
        end
    end

    if enemy3.health <= 0 then
        enemy3.time = enemy3.time + dt
        if enemy3.time < 0.5 then
            enemy3.death = true
        else
            enemy3.death = false
        end
    end

    if enemy4.health <= 0 then
        enemy4.time = enemy4.time + dt
        if enemy4.time < 0.5 then
            enemy4.death = true
        else
            enemy4.death = false
        end
    end

    if enemy5.health <= 0 then
        enemy5.time = enemy5.time + dt
        if enemy5.time < 0.5 then
            enemy5.death = true
        else
            enemy5.death = false
        end
    end

    if enemy6.health <= 0 then
        enemy6.time = enemy6.time + dt
        if enemy6.time < 0.5 then
            enemy6.death = true
        else
            enemy6.death = false
        end
    end

    if enemy7.health <= 0 then
        enemy7.time = enemy7.time + dt
        if enemy7.time < 0.5 then
            enemy7.death = true
        else
            enemy7.death = false
        end
    end

    if enemy8.health <= 0 then
        enemy8.time = enemy8.time + dt
        if enemy8.time < 0.5 then
            enemy8.death = true
        else
            enemy8.death = false
        end
    end

    if enemy9.health <= 0 then
        enemy9.time = enemy9.time + dt
        if enemy9.time < 0.5 then
            enemy9.death = true
        else
            enemy9.death = false
        end
    end

    if enemy10.health <= 0 then
        enemy10.time = enemy10.time + dt
        if enemy10.time < 0.5 then
            enemy10.death = true
        else
            enemy10.death = false
        end
    end

    if enemy11.health <= 0 then
        enemy11.time = enemy11.time + dt
        if enemy11.time < 0.5 then
            enemy11.death = true
        else
            enemy11.death = false
        end
    end

    if enemy12.health <= 0 then
        enemy12.time = enemy12.time + dt
        if enemy12.time < 0.5 then
            enemy12.death = true
        else
            enemy12.death = false
        end
    end

    if player.health <= 0 then
        player.time = player.time + dt
        if player.time < 0.5 then
            player.death = true
        else
            player.death = false
        end
    end

	player.heat = math.max(0, player.heat - dt)
    
    if gameState == 'play' then
        for i, o in ipairs(bullets) do
            o.x = o.x + math.cos(o.dir) * o.speed * dt
            o.y = o.y + math.sin(o.dir) * o.speed * dt
        end

        for i = #bullets, 1, -1 do
            local o = bullets[i]
            if (o.x < -10) or (o.x > love.graphics.getWidth() + 10)
            or (o.y < -10) or (o.y > love.graphics.getHeight() + 10) then
                table.remove(bullets, i)
            end
        end

        if enemy1_timer > 0.2 and enemy4.health <= 0 and enemy7.health <= 0 and enemy1.health > 0 then
            if math.random(5) == 1 then
                enemy1_timer = 0
                local direction1 = math.atan2(-1 , 0)
                table.insert(bullets1, {
                    x = enemy1.x + enemy1.width / 2,
                    y = enemy1.y + enemy1.height,
                    dir = direction1,
                    speed = 400
                })
                enemy1.heat = enemy1.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy1_timer = 0
            end
        end
            
        enemy1.heat = math.max(0, enemy1.heat - dt)
        for i, b in ipairs(bullets1) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets1, 1, -1 do
            local b = bullets1[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets1, i)
            end
        end

        if enemy2_timer > 0.2 and enemy5.health <=0 and enemy8.health <= 0 and enemy2.health > 0 then
            if math.random(5) == 1 then
                enemy2_timer = 0
                local direction2 = math.atan2(-1 , 0)
                table.insert(bullets2, {
                    x = enemy2.x + enemy2.width / 2,
                    y = enemy2.y + enemy2.height,
                    dir = direction2,
                    speed = 400
                })
                enemy2.heat = enemy2.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy2_timer = 0
            end
        end
            
        enemy2.heat = math.max(0, enemy2.heat - dt)
        for i, b in ipairs(bullets2) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets2, 1, -1 do
            local b = bullets2[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets2, i)
            end
        end

        if enemy3_timer > 0.2 and enemy6.health <= 0 and enemy9.health <= 0 and enemy3.health > 0 then
            if math.random(5) == 1 then
                enemy3_timer = 0
                local direction3 = math.atan2(-1 , 0)
                table.insert(bullets3, {
                    x = enemy3.x + enemy3.width / 2,
                    y = enemy3.y + enemy3.height,
                    dir = direction3,
                    speed = 400
                })
                enemy3.heat = enemy3.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy3_timer = 0
            end
        end
            
        enemy3.heat = math.max(0, enemy3.heat - dt)
        for i, b in ipairs(bullets3) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets3, 1, -1 do
            local b = bullets3[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets3, i)
            end
        end

        if enemy4_timer > 0.4 and enemy4.health > 0 and enemy7.health <= 0 then
            if math.random(6) == 1 then
                enemy4_timer = 0
                local direction4 = math.atan2(-1 , 0)
                table.insert(bullets4, {
                    x = enemy4.x + enemy4.width / 2,
                    y = enemy4.y + enemy4.height,
                    dir = direction4,
                    speed = 300
                })
                enemy4.heat = enemy4.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy4_timer = 0
            end
        end
            
        enemy4.heat = math.max(0, enemy4.heat - dt)
        for i, b in ipairs(bullets4) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets4, 1, -1 do
            local b = bullets4[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets4, i)
            end
        end

        if enemy5_timer > 0.4 and enemy8.health <= 0 and enemy5.health > 0 then
            if math.random(6) == 1 then
                enemy5_timer = 0
                local direction5 = math.atan2(-1 , 0)
                table.insert(bullets5, {
                    x = enemy5.x + enemy5.width / 2,
                    y = enemy5.y + enemy5.height,
                    dir = direction5,
                    speed = 300
                })
                enemy5.heat = enemy5.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy5_timer = 0
            end
        end
            
        enemy5.heat = math.max(0, enemy5.heat - dt)
        for i, b in ipairs(bullets5) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets5, 1, -1 do
            local b = bullets5[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets5, i)
            end
        end

        if enemy6_timer > 0.4 and enemy6.health > 0 and enemy9.health <= 0 then
            if math.random(6) == 1 then
                enemy6_timer = 0
                local direction6 = math.atan2(-1 , 0)
                table.insert(bullets6, {
                    x = enemy6.x + enemy6.width / 2,
                    y = enemy6.y + enemy6.height,
                    dir = direction6,
                    speed = 300
                })
                enemy6.heat = enemy6.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy6_timer = 0
            end
        end
            
        enemy6.heat = math.max(0, enemy6.heat - dt)
        for i, b in ipairs(bullets6) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets6, 1, -1 do
            local b = bullets6[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets6, i)
            end
        end

        if enemy7_timer > 0.4 and enemy7.health > 0 then
            if math.random(6) == 1 then
                enemy7_timer = 0
                local direction7 = math.atan2(-1 , 0)
                table.insert(bullets7, {
                    x = enemy7.x + enemy7.width / 2,
                    y = enemy7.y + enemy7.height,
                    dir = direction7,
                    speed = 300
                })
                enemy7.heat = enemy7.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy7_timer = 0
            end
        end
            
        enemy7.heat = math.max(0, enemy7.heat - dt)
        for i, b in ipairs(bullets7) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets7, 1, -1 do
            local b = bullets7[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets7, i)
            end
        end

        if enemy8_timer > 0.4 and enemy8.health > 0 then
            if math.random(6) == 1 then
                enemy8_timer = 0
                local direction8 = math.atan2(-1 , 0)
                table.insert(bullets8, {
                    x = enemy8.x + enemy8.width / 2,
                    y = enemy8.y + enemy8.height,
                    dir = direction8,
                    speed = 300
                })
                enemy8.heat = enemy8.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy8_timer = 0
            end
        end
            
        enemy8.heat = math.max(0, enemy8.heat - dt)
        for i, b in ipairs(bullets8) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets8, 1, -1 do
            local b = bullets8[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets8, i)
            end
        end

        if enemy9_timer > 0.4 and enemy9.health > 0 then
            if math.random(6) == 1 then
                enemy9_timer = 0
                local direction9 = math.atan2(-1 , 0)
                table.insert(bullets9, {
                    x = enemy9.x + enemy9.width / 2,
                    y = enemy9.y + enemy9.height,
                    dir = direction9,
                    speed = 300
                })
                enemy9.heat = enemy9.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy9_timer = 0
            end
        end
            
        enemy9.heat = math.max(0, enemy9.heat - dt)
        for i, b in ipairs(bullets9) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets9, 1, -1 do
            local b = bullets9[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets9, i)
            end
        end

        if enemy10_timer > 0.2 and enemy11.health <= 0 and enemy12.health <=0 and enemy10.health > 0 then
            if math.random(5) == 1 then
                enemy10_timer = 0
                local direction10 = math.atan2(-1 , 0)
                table.insert(bullets10, {
                    x = enemy10.x + enemy10.width / 2,
                    y = enemy10.y + enemy10.height,
                    dir = direction10,
                    speed = 400
                })
                enemy10.heat = enemy10.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy10_timer = 0
            end
        end
            
        enemy10.heat = math.max(0, enemy10.heat - dt)
        for i, b in ipairs(bullets10) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets10, 1, -1 do
            local b = bullets10[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets10, i)
            end
        end

        if enemy11_timer > 0.4 and enemy11.health > 0 and enemy12.health <= 0 then
            if math.random(6) == 1 then
                enemy11_timer = 0
                local direction11 = math.atan2(-1 , 0)
                table.insert(bullets11, {
                    x = enemy11.x + enemy11.width / 2,
                    y = enemy11.y + enemy11.height,
                    dir = direction11,
                    speed = 300
                })
                enemy11.heat = enemy11.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy11_timer = 0
            end
        end
            
        enemy11.heat = math.max(0, enemy11.heat - dt)
        for i, b in ipairs(bullets11) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets11, 1, -1 do
            local b = bullets11[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets11, i)
            end
        end

        if enemy12_timer > 0.4 and enemy12.health > 0 then
            if math.random(6) == 1 then
                enemy12_timer = 0
                local direction12 = math.atan2(-1 , 0)
                table.insert(bullets12, {
                    x = enemy12.x + enemy12.width / 2,
                    y = enemy12.y + enemy12.height,
                    dir = direction12,
                    speed = 300
                })
                enemy12.heat = enemy12.heatp
                sounds['enemy_shoot']:play()
            else 
                enemy12_timer = 0
            end
        end
            
        enemy12.heat = math.max(0, enemy12.heat - dt)
        for i, b in ipairs(bullets12) do
            b.y = b.y + b.speed * dt
        end

        for i = #bullets12, 1, -1 do
            local b = bullets12[i]
            if (b.x < -10) or (b.x > love.graphics.getWidth() + 10)
            or (b.y < -10) or (b.y > love.graphics.getHeight() + 10) then
                table.remove(bullets12, i)
            end
        end
    end

    if love.keyboard.isDown("right") and player.x < WINDOW_WIDTH - player.width then
        player.x = player.x + player.dx * dt
    end
    if love.keyboard.isDown("left") and player.x > 0 then
        player.x = player.x - player.dx * dt
    end

    if gameState =='play' then
        bullets.y = bullets.y + bullets.dy * dt
    end

    if gameState == 'play' then
        enemy_timer = enemy_timer + dt
        enemy1_timer = enemy1_timer + dt
        enemy2_timer = enemy2_timer + dt
        enemy3_timer = enemy3_timer + dt
        enemy4_timer = enemy4_timer + dt
        enemy5_timer = enemy5_timer + dt
        enemy6_timer = enemy6_timer + dt
        enemy7_timer = enemy7_timer + dt
        enemy8_timer = enemy8_timer + dt
        enemy9_timer = enemy9_timer + dt
        enemy10_timer = enemy10_timer + dt
        enemy11_timer = enemy11_timer + dt
        enemy12_timer = enemy12_timer + dt

        if enemy12.x + enemy12.width >= 779 and enemy1.y == 10 + enemy_gap_y * 8 then
            enemy_movement = 0
        elseif enemy1.x <= 11 and enemy1.y == 10 + enemy_gap_y * 8 then
            enemy_movement = 1
        end

        if enemy_timer > 1 and enemy12.x + enemy12.width < 780 and enemy1.y == 10 then
            enemy_timer = 0
            enemy1.x = enemy1.x + enemy_gap * 2
            enemy2.x = enemy2.x + enemy_gap * 2
            enemy3.x = enemy3.x + enemy_gap * 2
            enemy4.x = enemy4.x + enemy_gap * 2
            enemy5.x = enemy5.x + enemy_gap * 2
            enemy6.x = enemy6.x + enemy_gap * 2
            enemy7.x = enemy7.x + enemy_gap * 2
            enemy8.x = enemy8.x + enemy_gap * 2
            enemy9.x = enemy9.x + enemy_gap * 2
            enemy10.x = enemy10.x + enemy_gap * 2
            enemy11.x = enemy11.x + enemy_gap * 2
            enemy12.x = enemy12.x + enemy_gap * 2
        elseif enemy_timer > 1 and enemy12.x + enemy12.width >= 780 and enemy1.y == 10 then
            enemy_timer = 0

            enemy1.y = enemy1.y + enemy_gap_y * 4
            enemy2.y = enemy2.y + enemy_gap_y * 4
            enemy3.y = enemy3.y + enemy_gap_y * 4
            enemy4.y = enemy4.y + enemy_gap_y * 4
            enemy5.y = enemy5.y + enemy_gap_y * 4
            enemy6.y = enemy6.y + enemy_gap_y * 4
            enemy7.y = enemy7.y + enemy_gap_y * 4
            enemy8.y = enemy8.y + enemy_gap_y * 4
            enemy9.y = enemy9.y + enemy_gap_y * 4
            enemy10.y = enemy10.y + enemy_gap_y * 4
            enemy11.y = enemy11.y + enemy_gap_y * 4
            enemy12.y = enemy12.y + enemy_gap_y * 4
        
        elseif enemy_timer > 1 and enemy1.x >= 11 and enemy1.y == 10 + enemy_gap_y * 4 then
            enemy_timer = 0

            enemy1.x = enemy1.x - enemy_gap * 2
            enemy2.x = enemy2.x - enemy_gap * 2
            enemy3.x = enemy3.x - enemy_gap * 2
            enemy4.x = enemy4.x - enemy_gap * 2
            enemy5.x = enemy5.x - enemy_gap * 2
            enemy6.x = enemy6.x - enemy_gap * 2
            enemy7.x = enemy7.x - enemy_gap * 2
            enemy8.x = enemy8.x - enemy_gap * 2
            enemy9.x = enemy9.x - enemy_gap * 2
            enemy10.x = enemy10.x - enemy_gap * 2
            enemy11.x = enemy11.x - enemy_gap * 2
            enemy12.x = enemy12.x - enemy_gap * 2

        elseif  enemy1.y == 10 + enemy_gap_y * 4 and enemy_timer > 1 and enemy1.x <= 11 then
            enemy_timer = 0
            enemy1.y = enemy1.y + enemy_gap_y * 4
            enemy2.y = enemy2.y + enemy_gap_y * 4
            enemy3.y = enemy3.y + enemy_gap_y * 4
            enemy4.y = enemy4.y + enemy_gap_y * 4 
            enemy5.y = enemy5.y + enemy_gap_y * 4
            enemy6.y = enemy6.y + enemy_gap_y * 4
            enemy7.y = enemy7.y + enemy_gap_y * 4
            enemy8.y = enemy8.y + enemy_gap_y * 4
            enemy9.y = enemy9.y + enemy_gap_y * 4
            enemy10.y = enemy10.y + enemy_gap_y * 4
            enemy11.y = enemy11.y + enemy_gap_y * 4
            enemy12.y = enemy12.y + enemy_gap_y * 4
        
        elseif enemy_timer > 1 and enemy1.x >= 11 and enemy1.y == 10 + enemy_gap_y * 8 and enemy_movement == 0 then
            enemy_timer = 0

            enemy1.x = enemy1.x - enemy_gap * 2
            enemy2.x = enemy2.x - enemy_gap * 2
            enemy3.x = enemy3.x - enemy_gap * 2
            enemy4.x = enemy4.x - enemy_gap * 2
            enemy5.x = enemy5.x - enemy_gap * 2
            enemy6.x = enemy6.x - enemy_gap * 2
            enemy7.x = enemy7.x - enemy_gap * 2
            enemy8.x = enemy8.x - enemy_gap * 2
            enemy9.x = enemy9.x - enemy_gap * 2
            enemy10.x = enemy10.x - enemy_gap * 2
            enemy11.x = enemy11.x - enemy_gap * 2
            enemy12.x = enemy12.x - enemy_gap * 2

        elseif enemy_timer > 1 and enemy12.x + enemy12.width < 780 and enemy1.y == 10 + enemy_gap_y * 8 and enemy_movement == 1 then
            enemy_timer = 0
            enemy1.x = enemy1.x + enemy_gap * 2
            enemy2.x = enemy2.x + enemy_gap * 2
            enemy3.x = enemy3.x + enemy_gap * 2
            enemy4.x = enemy4.x + enemy_gap * 2
            enemy5.x = enemy5.x + enemy_gap * 2
            enemy6.x = enemy6.x + enemy_gap * 2
            enemy7.x = enemy7.x + enemy_gap * 2
            enemy8.x = enemy8.x + enemy_gap * 2
            enemy9.x = enemy9.x + enemy_gap * 2
            enemy10.x = enemy10.x + enemy_gap * 2
            enemy11.x = enemy11.x + enemy_gap * 2
            enemy12.x = enemy12.x + enemy_gap * 2
        end
    end

    for i = #bullets, 1, -1 do
        local o = bullets[i]
        if (o.x < enemy7.x + enemy7.width) and (o.x > enemy7.x)and (o.y <= enemy7.y + enemy7.height) and enemy7.health > 0 and (o.y >= enemy7.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy7.health = enemy7.health - 50
        elseif (o.x < enemy1.x + enemy1.width) and (o.x > enemy1.x)and (o.y <= enemy1.y + enemy1.height) and enemy1.health > 0 and (o.y >= enemy1.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy1.health = enemy1.health - 50
        elseif (o.x < enemy2.x + enemy2.width) and (o.x > enemy2.x)and (o.y <= enemy2.y + enemy2.height) and enemy2.health > 0 and (o.y >= enemy2.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy2.health = enemy2.health - 50
        elseif (o.x < enemy2.x + enemy2.width) and (o.x > enemy2.x)and (o.y <= enemy2.y + enemy2.height) and enemy2.health > 0 and (o.y >= enemy2.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy2.health = enemy2.health - 50
        elseif (o.x < enemy3.x + enemy3.width) and (o.x > enemy3.x)and (o.y <= enemy3.y + enemy3.height) and enemy3.health > 0 and (o.y >= enemy3.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy3.health = enemy3.health - 50
        elseif (o.x < enemy4.x + enemy4.width) and (o.x > enemy4.x)and (o.y <= enemy4.y + enemy4.height) and enemy4.health > 0 and (o.y >= enemy4.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy4.health = enemy4.health - 50
        elseif (o.x < enemy5.x + enemy5.width) and (o.x > enemy5.x)and (o.y <= enemy5.y + enemy5.height) and enemy5.health > 0 and (o.y >= enemy5.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy5.health = enemy5.health - 50
        elseif (o.x < enemy6.x + enemy6.width) and (o.x > enemy6.x)and (o.y <= enemy6.y + enemy6.height) and enemy6.health > 0 and (o.y >= enemy6.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy6.health = enemy6.health - 50
        elseif (o.x < enemy8.x + enemy8.width) and (o.x > enemy8.x)and (o.y <= enemy8.y + enemy8.height) and enemy8.health > 0 and (o.y >= enemy8.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy8.health = enemy8.health - 50
        elseif (o.x < enemy9.x + enemy9.width) and (o.x > enemy9.x)and (o.y <= enemy9.y + enemy9.height) and enemy9.health > 0 and (o.y >= enemy9.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy9.health = enemy9.health - 50
        elseif (o.x < enemy10.x + enemy10.width) and (o.x > enemy10.x)and (o.y <= enemy10.y + enemy10.height) and enemy10.health > 0 and (o.y >= enemy10.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy10.health = enemy10.health - 50
        elseif (o.x < enemy11.x + enemy11.width) and (o.x > enemy11.x)and (o.y <= enemy11.y + enemy11.height) and enemy11.health > 0 and (o.y >= enemy11.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy11.health = enemy11.health - 50
        elseif (o.x < enemy12.x + enemy12.width) and (o.x > enemy12.x)and (o.y <= enemy12.y + enemy12.height) and enemy12.health > 0 and (o.y >= enemy12.y) then
            table.remove(bullets, i)
            sounds['hit']:play()
            enemy12.health = enemy12.health - 50
        end
    end

    for i = #bullets7, 1, -1 do
        local o = bullets7[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets7, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets1, 1, -1 do
        local o = bullets1[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets1, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets2, 1, -1 do
        local o = bullets2[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets2, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets3, 1, -1 do
        local o = bullets3[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets3, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets4, 1, -1 do
        local o = bullets4[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets4, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets5, 1, -1 do
        local o = bullets5[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets5, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets6, 1, -1 do
        local o = bullets6[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets6, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets8, 1, -1 do
        local o = bullets8[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets8, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets9, 1, -1 do
        local o = bullets9[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets9, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets10, 1, -1 do
        local o = bullets10[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets10, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets11, 1, -1 do
        local o = bullets11[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets11, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end
    for i = #bullets12, 1, -1 do
        local o = bullets12[i]
        if (o.x < player.x + player.width) and (o.x > player.x)and (o.y <= player.y + player.height) and player.health > 0 and (o.y >= player.y) then
            table.remove(bullets12, i)
            player.health = player.health - 1
            sounds['hit']:play()
        end
    end

    if player.health <= 0 then
        gameState = 'defeat'
    end

    if enemy_total_health <= 0 then
        gameState = 'victory'
    end
end

function displayFPS()
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), WINDOW_WIDTH - 60, 562)
end
 