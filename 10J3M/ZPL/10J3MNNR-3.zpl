set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8918, <2> 20.978, <3> 20.4243, <4> 29.2379, <5> 24.2588, <6> 18.2699, <7> 18.7996, <8> 29.3371, <9> 28.1451, <10> 28.5007;
param workload[JOB] := <1> 7.9479, <2> 31.1888, <3> 31.223, <4> 3.2322, <5> 10.2006, <6> 27.6893, <7> 45.6377, <8> 46.6556, <9> 9.0886, <10> 31.1522;
param capacity[MACHINE] := <1> 244.0159, <2> 244.0159, <3> 244.0159;

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
