local defaultNotePos = {};
local spin = true;
local arrowMoveX = 0;
local arrowMoveY = 0;

function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x,y})
      --  debugPrint("{" .. x .. "," .. y .. "}" .. " i:".. i)
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 900) * (bpm / 150)

    if  spin == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*1.35) * math.pi))

            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*1.65) * math.pi))
        end
    end
end

function onEvent(name,value1,value2)
	if name == 'move deez nuts' then 

		if value1 == '0' then
		    arrowMoveX = 0;
            arrowMoveY = 0;
		end
		if value1 == '1' then
		    arrowMoveX = 34;
            arrowMoveY = 17;
		end
		if value1 == '2' then
            arrowMoveX = 0;
            arrowMoveY = 60;
        end
        if value1 == '3' then
            arrowMoveX = 30;
            arrowMoveY = 30;
        end
        if value1 == '4' then
            arrowMoveX = 60;
            arrowMoveY = 10;
        end
        if value1 == '5' then
            arrowMoveX = 10;
            arrowMoveY = 34;
        end
	end
end
