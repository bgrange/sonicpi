

live_loop :knuckles do
  r = 0.7
  16.times do
    sync :tick
    s = 1
    10.times do
      sample :perc_snap, rate:r, amp: 0.5
      sleep 0.03*s
      s *= 1.2
    end
    r *= 0.9
  end
end

live_loop :tick do
  cue :tick
  sleep 1
end

live_loop :triptick do
  cue :triptick
  sleep 0.75
end



live_loop :hiss do
  sample :vinyl_hiss, rate: 5
  sleep 1
end

live_loop :bass do
  sample :bass_thick_c, amp: 10, rate: 0.68, start: 0, finish: 0.3, release: 0.7
  sleep 8
end

live_loop :ambi do
  sample :ambi_glass_hum, rate: choose([0.25, 0.4, 0.6, 1]), amp: 20
  sleep 4
end

p = 24
live_loop :pulse do
  #sample :bd_808, amp: 20, pitch: p%25
  p -= 2
  sleep 1
end

sleep 16

live_loop :cym do
  #sync :triptick
  sample :drum_cymbal_soft, amp: 2
  sleep 0.75
end

live_loop :bd do
  #sync :triptick
  sample :drum_bass_hard, amp: 5
  sleep 6
end

live_loop :sn do
  #sync :triptick
  sleep 3
  sample :drum_snare_hard, amp: 4
  sleep 3
end

sync :tick
live_loop :stuff do
  idxs = [0,1,2,3,4,5,6,7]
  rhythm = [[2],
            [1,1],
            [1,1,2],
            [1,1,1,1],
            [1,1,1,1,2],
            [1,1,1,1,1,1],
            [1,1,1,1,1,1,2],
            [1,1,1,1,1,1,1,1]]
  i = choose(idxs)
  len = i + 1
  r = rhythm[i]
  j = 0
  
  len.times do
    s = choose([:drum_snare_hard, :drum_bass_hard,
                :drum_cymbal_closed, :drum_tom_hi_hard, :drum_tom_lo_hard, :drum_cowbell])
    sample s, amp: 4
    sleep r[j]/8.to_f

    j += 1
  end
  sleep 0.5
end

