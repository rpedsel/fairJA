set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.7605, <2> 26.1761, <3> 24.0986, <4> 18.7709, <5> 33.6169, <6> 48.58, <7> 29.2519, <8> 44.9159, <9> 43.2575, <10> 1.9335;
param workload[JOB] := <1> 1351.3344, <2> 685.1882, <3> 580.7425, <4> 352.3467, <5> 1130.096, <6> 2360.0164, <7> 855.6737, <8> 2017.4381, <9> 1871.2113, <10> 3.7384;
param capacity[MACHINE] := <1> 11207.7857, <2> 11207.7857, <3> 11207.7857;

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
