set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.1147, <2> 33.3093, <3> 36.6119, <4> 44.3504, <5> 36.7491, <6> 25.3518, <7> 7.3938, <8> 36.878, <9> 23.8322, <10> 2.1034, <11> 20.7048, <12> 47.4344, <13> 43.8877, <14> 24.2911, <15> 40.1623, <16> 30.6909, <17> 30.3305, <18> 18.1568, <19> 28.9077, <20> 43.9879;
param workload[JOB] := <1> 5.3023, <2> 5.7714, <3> 6.0508, <4> 6.6596, <5> 6.0621, <6> 5.0351, <7> 2.7192, <8> 6.0727, <9> 4.8818, <10> 1.4503, <11> 4.5503, <12> 6.8873, <13> 6.6248, <14> 4.9286, <15> 6.3374, <16> 5.5399, <17> 5.5073, <18> 4.2611, <19> 5.3766, <20> 6.6323;
param capacity[MACHINE] := <1> 15.2358, <2> 15.2358, <3> 15.2358, <4> 15.2358, <5> 15.2358, <6> 15.2358, <7> 15.2358;

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
