use_bpm 60

define :sn do
  sample :drum_snare_soft
end

define :ghost do |s|
  sample s, amp: 0.2
end

define :soft do |s|
  sample s, amp: 0.5
end

define :accent do |s|
  sample s, amp: 1.5
end


define :flam do |s|
  in_thread do
    ghost s
    sleep 0.04
    accent s
  end
end

define :flam_triplet do |s|
  in_thread do
    flam s
    sleep 0.33
    soft s
    sleep 0.33
    ghost s
    sleep 0.34
  end
end

define :paradiddle do |a,b|
  in_thread do
    accent a
    sleep 0.5
    soft b
    sleep 0.5
    soft a
    sleep 0.5
    soft a
    sleep 0.5
    accent b
    sleep 0.5
    soft a
    sleep 0.5
    soft b
    sleep 0.5
    soft b
    sleep 0.5
  end
end

define :cool do
  in_thread do
    sample :drum_bass_soft
    sample :drum_cymbal_soft
    sleep 0.25
    sample :drum_snare_soft
    sleep 0.25
    sample :drum_snare_soft
    sleep 0.25
    sample :drum_bass_soft
    sample :drum_cymbal_soft
    sleep 0.25
  end
end

live_loop :jizz do
  stop
  use_bpm 120
  flam_triplet :drum_snare_soft
  sleep 1
  flam_triplet :drum_tom_hi_soft
  sleep 1
  flam_triplet :drum_tom_lo_hard
  sleep 1
end

live_loop :jizz do
  use_bpm 120
  cool
  sleep 1
end

live_loop :feet do
  #use_bpm 60
  #s1 = :drum_bass_soft
  #s2 = :drum_cymbal_pedal
  #paradiddle s1,s2
  use_bpm 120
  sample :drum_cymbal_pedal, amp: 0.5
  sleep 1
end


