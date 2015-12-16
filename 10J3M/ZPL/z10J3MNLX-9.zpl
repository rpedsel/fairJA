set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.82, <2> 20.73, <3> 22.0731, <4> 16.292, <5> 25.838, <6> 21.8389, <7> 24.6558, <8> 19.805, <9> 24.664, <10> 27.6689;
param workload[JOB] := <1> 5.0813, <2> 4.553, <3> 4.6982, <4> 4.0363, <5> 5.0831, <6> 4.6732, <7> 4.9655, <8> 4.4503, <9> 4.9663, <10> 5.2601;
param capacity[MACHINE] := <1> 15.9224, <2> 15.9224, <3> 15.9224;

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
