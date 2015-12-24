set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.543, <2> 14.5452, <3> 20.9284, <4> 8.9086, <5> 12.8197, <6> 18.0546, <7> 36.4957, <8> 23.1707, <9> 28.5235, <10> 40.9289, <11> 32.3504, <12> 49.9658, <13> 18.2125, <14> 30.2073, <15> 41.6409, <16> 3.5948, <17> 11.9233, <18> 39.1888, <19> 20.9451, <20> 16.7851;
param workload[JOB] := <1> 22.37, <2> 45.0173, <3> 13.5717, <4> 21.5622, <5> 4.5858, <6> 25.22, <7> 8.8805, <8> 48.4317, <9> 45.1674, <10> 46.1148, <11> 43.1161, <12> 29.6066, <13> 22.5684, <14> 4.0679, <15> 32.629, <16> 8.0599, <17> 37.9385, <18> 48.9531, <19> 12.9263, <20> 13.7943;
param capacity[MACHINE] := <1> 57.2766, <2> 57.2766, <3> 57.2766, <4> 57.2766, <5> 57.2766, <6> 57.2766, <7> 57.2766;

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
