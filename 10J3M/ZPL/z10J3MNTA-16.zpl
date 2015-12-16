set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4654, <2> 26.0092, <3> 27.0044, <4> 25.3987, <5> 28.9212, <6> 20.435, <7> 29.3187, <8> 27.439, <9> 19.3772, <10> 21.3632;
param workload[JOB] := <1> 1187.8638, <2> 676.4785, <3> 729.2376, <4> 645.094, <5> 836.4358, <6> 417.5892, <7> 859.5862, <8> 752.8987, <9> 375.4759, <10> 456.3863;
param capacity[MACHINE] := <1> 1734.2615, <2> 1734.2615, <3> 1734.2615;

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
