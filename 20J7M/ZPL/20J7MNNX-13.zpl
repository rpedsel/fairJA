set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2703, <2> 31.4426, <3> 21.7857, <4> 30.7428, <5> 22.3808, <6> 29.936, <7> 22.6654, <8> 22.4517, <9> 25.7226, <10> 20.0934, <11> 23.188, <12> 24.9305, <13> 12.6189, <14> 29.9087, <15> 28.6055, <16> 33.7639, <17> 23.4034, <18> 30.31, <19> 17.8363, <20> 29.5754;
param workload[JOB] := <1> 5.2221, <2> 5.6074, <3> 4.6675, <4> 5.5446, <5> 4.7308, <6> 5.4714, <7> 4.7608, <8> 4.7383, <9> 5.0717, <10> 4.4826, <11> 4.8154, <12> 4.993, <13> 3.5523, <14> 5.4689, <15> 5.3484, <16> 5.8107, <17> 4.8377, <18> 5.5055, <19> 4.2233, <20> 5.4383;
param capacity[MACHINE] := <1> 100.2907, <2> 100.2907, <3> 100.2907, <4> 100.2907, <5> 100.2907, <6> 100.2907, <7> 100.2907;

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
