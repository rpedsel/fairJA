set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.0343, <2> 46.4629, <3> 3.1737, <4> 39.9955, <5> 1.5579, <6> 33.6458, <7> 19.5651, <8> 20.2664, <9> 34.1963, <10> 26.3071;
param workload[JOB] := <1> 6.4058, <2> 6.8164, <3> 1.7815, <4> 6.3242, <5> 1.2482, <6> 5.8005, <7> 4.4232, <8> 4.5018, <9> 5.8478, <10> 5.129;
param capacity[MACHINE] := <1> 16.0928, <2> 16.0928, <3> 16.0928;

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
