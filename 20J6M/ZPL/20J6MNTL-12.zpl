set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0897, <2> 23.915, <3> 27.1315, <4> 27.9199, <5> 30.5801, <6> 19.1547, <7> 22.51, <8> 27.1823, <9> 27.5523, <10> 26.2477, <11> 34.8369, <12> 30.3928, <13> 16.989, <14> 29.2461, <15> 31.7253, <16> 28.7117, <17> 21.0384, <18> 19.4885, <19> 24.8688, <20> 32.6929;
param workload[JOB] := <1> 26.0897, <2> 23.915, <3> 27.1315, <4> 27.9199, <5> 30.5801, <6> 19.1547, <7> 22.51, <8> 27.1823, <9> 27.5523, <10> 26.2477, <11> 34.8369, <12> 30.3928, <13> 16.989, <14> 29.2461, <15> 31.7253, <16> 28.7117, <17> 21.0384, <18> 19.4885, <19> 24.8688, <20> 32.6929;
param capacity[MACHINE] := <1> 66.0342, <2> 66.0342, <3> 66.0342, <4> 66.0342, <5> 66.0342, <6> 66.0342;

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
