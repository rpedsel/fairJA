set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.5281, <2> 44.3396, <3> 27.0128, <4> 21.7522, <5> 14.5534, <6> 26.286, <7> 41.1904, <8> 44.0359, <9> 25.1682, <10> 31.2674, <11> 45.7292, <12> 38.3643, <13> 44.5669, <14> 41.594, <15> 27.1333, <16> 11.0771, <17> 19.8746, <18> 6.3387, <19> 45.9795, <20> 11.6369;
param workload[JOB] := <1> 6.7792, <2> 14.6534, <3> 3.4302, <4> 3.5185, <5> 44.6059, <6> 13.9382, <7> 13.2731, <8> 39.8002, <9> 11.2939, <10> 23.9155, <11> 16.7004, <12> 0.6919, <13> 1.6884, <14> 31.1395, <15> 32.3034, <16> 42.4902, <17> 27.4209, <18> 8.4368, <19> 7.9579, <20> 46.3092;
param capacity[MACHINE] := <1> 390.3467, <2> 390.3467, <3> 390.3467, <4> 390.3467, <5> 390.3467, <6> 390.3467;

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
