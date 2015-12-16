set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5067, <2> 31.4475, <3> 25.7754, <4> 30.0342, <5> 29.5102, <6> 25.0041, <7> 30.5158, <8> 17.0469, <9> 14.7102, <10> 13.0865, <11> 24.6339, <12> 28.398, <13> 21.2336, <14> 29.8961, <15> 23.1489, <16> 29.2035, <17> 19.7358, <18> 22.6023, <19> 28.5083, <20> 32.1627;
param workload[JOB] := <1> 27.9444, <2> 15.7902, <3> 7.1227, <4> 13.7212, <5> 6.2231, <6> 27.9729, <7> 14.1176, <8> 40.8049, <9> 2.2109, <10> 13.1621, <11> 10.7024, <12> 33.9417, <13> 16.78, <14> 27.1476, <15> 5.277, <16> 33.2825, <17> 7.9268, <18> 39.1027, <19> 25.8964, <20> 18.4341;
param capacity[MACHINE] := <1> 64.5935, <2> 64.5935, <3> 64.5935, <4> 64.5935, <5> 64.5935, <6> 64.5935;

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
