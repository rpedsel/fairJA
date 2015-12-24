set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5976, <2> 23.2689, <3> 18.3232, <4> 12.3714, <5> 44.1848, <6> 34.3289, <7> 20.4027, <8> 6.4646, <9> 38.2949, <10> 36.0194;
param workload[JOB] := <1> 4.8577, <2> 4.8238, <3> 4.2806, <4> 3.5173, <5> 6.6472, <6> 5.8591, <7> 4.5169, <8> 2.5426, <9> 6.1883, <10> 6.0016;
param capacity[MACHINE] := <1> 12.3088, <2> 12.3088, <3> 12.3088;

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
