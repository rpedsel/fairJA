set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.0446, <2> 44.7067, <3> 33.5877, <4> 33.4767, <5> 15.2477, <6> 13.625, <7> 46.2973, <8> 1.6709, <9> 25.9655, <10> 37.8081;
param workload[JOB] := <1> 36.9275, <2> 34.5804, <3> 20.9613, <4> 6.3297, <5> 46.6488, <6> 14.7528, <7> 5.5521, <8> 22.8139, <9> 39.2088, <10> 7.5089;
param capacity[MACHINE] := <1> 235.2842, <2> 235.2842, <3> 235.2842;

var x[JM] binary;
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
