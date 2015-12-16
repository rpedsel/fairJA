set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.9959, <2> 20.6052, <3> 27.5202, <4> 31.5793, <5> 20.3777, <6> 28.0107, <7> 12.7802, <8> 28.718, <9> 22.7135, <10> 26.9725, <11> 23.505, <12> 22.636, <13> 20.6417, <14> 32.2716, <15> 23.1358, <16> 23.4124, <17> 28.2867, <18> 26.8079, <19> 33.2448, <20> 25.0301;
param workload[JOB] := <1> 11.9959, <2> 20.6052, <3> 27.5202, <4> 31.5793, <5> 20.3777, <6> 28.0107, <7> 12.7802, <8> 28.718, <9> 22.7135, <10> 26.9725, <11> 23.505, <12> 22.636, <13> 20.6417, <14> 32.2716, <15> 23.1358, <16> 23.4124, <17> 28.2867, <18> 26.8079, <19> 33.2448, <20> 25.0301;
param capacity[MACHINE] := <1> 490.2452, <2> 490.2452, <3> 490.2452, <4> 490.2452, <5> 490.2452, <6> 490.2452;

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
