use_bpm 60

define :hh do
  use_synth :pnoise
  with_fx :hpf, cutoff: 120 do
    play release: 0.01, amp: 13
  end
end

define :sn do
  with_fx :lpf, cutoff: 90 do
    sample :sn_dub, sustain: 0, release: 0.05, amp: 3
  end
end

define :rand_drum do
  if one_in(3)
    sample :drum_cymbal_closed
  else if one_in(2)
    sample :drum_tom_hi_soft
  else
    sample :drum_snare_soft
end end
end

live_loop :shit do
  d = choose([8,6])
  density d do
    rand_drum
    sleep 1
  end
end

live_loop :bd_pattern do
  sample :bd
  sleep 0.5
end