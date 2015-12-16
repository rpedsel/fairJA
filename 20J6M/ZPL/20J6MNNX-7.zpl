set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.8124, <2> 28.1144, <3> 27.9076, <4> 25.3018, <5> 26.6047, <6> 23.5089, <7> 25.7813, <8> 24.5641, <9> 21.8055, <10> 26.7808, <11> 16.4091, <12> 24.4634, <13> 23.4027, <14> 25.0552, <15> 28.6638, <16> 17.014, <17> 19.2334, <18> 10.9744, <19> 36.6248, <20> 16.5491;
param workload[JOB] := <1> 4.7762, <2> 5.3023, <3> 5.2828, <4> 5.0301, <5> 5.158, <6> 4.8486, <7> 5.0775, <8> 4.9562, <9> 4.6696, <10> 5.175, <11> 4.0508, <12> 4.946, <13> 4.8376, <14> 5.0055, <15> 5.3539, <16> 4.1248, <17> 4.3856, <18> 3.3128, <19> 6.0518, <20> 4.0681;
param capacity[MACHINE] := <1> 96.4132, <2> 96.4132, <3> 96.4132, <4> 96.4132, <5> 96.4132, <6> 96.4132;

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
