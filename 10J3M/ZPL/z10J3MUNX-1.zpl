set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.9809, <2> 42.9438, <3> 17.9057, <4> 0.4429, <5> 35.7385, <6> 25.8533, <7> 20.5611, <8> 20.5603, <9> 27.7681, <10> 48.8852;
param workload[JOB] := <1> 3.6029, <2> 6.5532, <3> 4.2315, <4> 0.6655, <5> 5.9782, <6> 5.0846, <7> 4.5344, <8> 4.5343, <9> 5.2695, <10> 6.9918;
param capacity[MACHINE] := <1> 47.4459, <2> 47.4459, <3> 47.4459;

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
