use_bpm 120

notes = (ring :C4, :E4, :B4, :C5, :D4, :F4, :B4, :C5)

live_loop :cute do
  #play notes.tick
  sleep 1
end

live_loop :part2 do
  #play ring(:G5, :F5, :E5, :C5, :B4, :C5, :B4, :C5, :B4, :G4,
  #:F4, :A4, :E5, :C5, :B4, :G4).tick
  sleep ring(1,1,1,5,0.5,0.5,0.5,0.5,1,5,
             1,1,1,4.75,3.25,5).look
end

define :hihat do
  use_synth :pnoise
  with_fx :hpf, cutoff: 120 do
    play release: 0.01, amp: 13
  end
end

live_loop :hh do
  hihat
  sleep 0.5
end

live_loop :bd do
  rests = (ring 0.75, 1.75, 0.25, 0.5, 0.75)
  sample :drum_bass_soft, amp: 2.5
  sleep rests.tick
end

live_loop :breakdown do
  play ring(:A3, :E3, :G3, :E3, :G3, :E3, :C4, :B3,
            :C4,:D4,:E4,:D4,:A3,:G3,:D3).tick
  sleep ring(0.5,1,1,0.5,0.5,0.5,0.5,4,1,1,1,1,1,1,5.5).look
end


live_loop :sn do
  sleep ring(1, 0.5, 0.75, 0.75).tick
  #with_fx :lpf, cutoff: 90 do
  #  sample :sn_dub, sustain: 0, release: 0.05, amp: 3
  #end
  sample :drum_snare_soft
  sleep ring(0, 0, 0, 0.5).look
end


