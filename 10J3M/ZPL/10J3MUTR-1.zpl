set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.4889, <2> 15.6196, <3> 27.0257, <4> 3.1742, <5> 42.3359, <6> 2.3794, <7> 18.1112, <8> 1.5898, <9> 15.7928, <10> 8.5949;
param workload[JOB] := <1> 10.7476, <2> 3.5152, <3> 1.2787, <4> 22.8395, <5> 42.477, <6> 35.824, <7> 42.091, <8> 23.1469, <9> 39.1912, <10> 32.7644;
param capacity[MACHINE] := <1> 63.4689, <2> 63.4689, <3> 63.4689;

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
