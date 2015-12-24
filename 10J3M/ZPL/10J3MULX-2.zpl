set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.4785, <2> 36.3717, <3> 18.9951, <4> 42.8986, <5> 15.9048, <6> 0.9778, <7> 30.0247, <8> 2.7322, <9> 18.9928, <10> 24.535;
param workload[JOB] := <1> 5.6106, <2> 6.0309, <3> 4.3583, <4> 6.5497, <5> 3.9881, <6> 0.9888, <7> 5.4795, <8> 1.6529, <9> 4.3581, <10> 4.9533;
param capacity[MACHINE] := <1> 14.6567, <2> 14.6567, <3> 14.6567;

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
