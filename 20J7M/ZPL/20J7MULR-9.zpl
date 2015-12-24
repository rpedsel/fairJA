set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1069, <2> 45.3574, <3> 34.5513, <4> 18.2549, <5> 11.4207, <6> 48.5761, <7> 0.3728, <8> 42.0348, <9> 6.6829, <10> 7.0004, <11> 11.1688, <12> 40.7552, <13> 17.0894, <14> 19.6997, <15> 13.9074, <16> 3.4526, <17> 44.0558, <18> 49.9113, <19> 4.1588, <20> 38.7477;
param workload[JOB] := <1> 11.201, <2> 44.7366, <3> 42.7319, <4> 46.8617, <5> 21.9221, <6> 36.5951, <7> 4.5228, <8> 9.6809, <9> 40.6663, <10> 26.6806, <11> 10.3323, <12> 37.189, <13> 34.8595, <14> 43.2054, <15> 46.6223, <16> 26.8512, <17> 26.6985, <18> 4.5348, <19> 45.9874, <20> 13.5236;
param capacity[MACHINE] := <1> 82.2004, <2> 82.2004, <3> 82.2004, <4> 82.2004, <5> 82.2004, <6> 82.2004, <7> 82.2004;

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
