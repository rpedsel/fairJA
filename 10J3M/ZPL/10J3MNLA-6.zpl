set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7615, <2> 30.2005, <3> 32.6452, <4> 27.7609, <5> 30.6294, <6> 21.9995, <7> 19.3828, <8> 27.8058, <9> 19.6244, <10> 22.5652;
param workload[JOB] := <1> 431.0399, <2> 912.0702, <3> 1065.7091, <4> 770.6676, <5> 938.1601, <6> 483.978, <7> 375.6929, <8> 773.1625, <9> 385.1171, <10> 509.1883;
param capacity[MACHINE] := <1> 2214.9286, <2> 2214.9286, <3> 2214.9286;

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
