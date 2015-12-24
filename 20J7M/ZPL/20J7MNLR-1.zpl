set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4123, <2> 27.7613, <3> 23.3311, <4> 19.383, <5> 17.4972, <6> 33.361, <7> 22.6403, <8> 34.2306, <9> 24.0563, <10> 24.1359, <11> 24.7684, <12> 39.4119, <13> 22.1435, <14> 25.2612, <15> 22.0357, <16> 26.3334, <17> 14.2045, <18> 19.113, <19> 27.6212, <20> 28.1112;
param workload[JOB] := <1> 12.5313, <2> 34.6693, <3> 6.2576, <4> 35.2754, <5> 32.9606, <6> 21.3988, <7> 33.5178, <8> 38.8123, <9> 16.8454, <10> 47.0457, <11> 4.0148, <12> 36.7497, <13> 48.6498, <14> 35.0859, <15> 15.3336, <16> 29.5805, <17> 16.0098, <18> 10.8269, <19> 40.8836, <20> 7.3703;
param capacity[MACHINE] := <1> 74.8313, <2> 74.8313, <3> 74.8313, <4> 74.8313, <5> 74.8313, <6> 74.8313, <7> 74.8313;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
