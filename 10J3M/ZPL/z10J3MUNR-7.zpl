set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9264, <2> 45.8583, <3> 22.3615, <4> 5.0018, <5> 18.5131, <6> 8.1186, <7> 1.0501, <8> 0.2985, <9> 36.6622, <10> 14.9856;
param workload[JOB] := <1> 46.8732, <2> 14.0503, <3> 18.9459, <4> 46.2679, <5> 31.6606, <6> 34.2943, <7> 6.6912, <8> 33.5901, <9> 48.7418, <10> 47.0382;
param capacity[MACHINE] := <1> 328.1535, <2> 328.1535, <3> 328.1535;

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
