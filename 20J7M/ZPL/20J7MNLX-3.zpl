set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0758, <2> 22.2282, <3> 14.9577, <4> 29.7964, <5> 34.4534, <6> 23.4194, <7> 18.5194, <8> 17.994, <9> 27.0008, <10> 17.9654, <11> 21.7056, <12> 18.3703, <13> 21.8267, <14> 27.3182, <15> 30.1895, <16> 21.4491, <17> 31.5144, <18> 32.7127, <19> 36.4657, <20> 18.6226;
param workload[JOB] := <1> 4.8037, <2> 4.7147, <3> 3.8675, <4> 5.4586, <5> 5.8697, <6> 4.8394, <7> 4.3034, <8> 4.2419, <9> 5.1962, <10> 4.2386, <11> 4.6589, <12> 4.2861, <13> 4.6719, <14> 5.2267, <15> 5.4945, <16> 4.6313, <17> 5.6138, <18> 5.7195, <19> 6.0387, <20> 4.3154;
param capacity[MACHINE] := <1> 14.0272, <2> 14.0272, <3> 14.0272, <4> 14.0272, <5> 14.0272, <6> 14.0272, <7> 14.0272;

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
