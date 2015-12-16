set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.867, <2> 24.568, <3> 23.5516, <4> 25.7658, <5> 25.5357, <6> 23.6236, <7> 26.5121, <8> 26.7339, <9> 31.2712, <10> 26.1069, <11> 32.1564, <12> 22.9942, <13> 28.602, <14> 30.0639, <15> 24.7736, <16> 36.3581, <17> 20.5622, <18> 28.7714, <19> 13.0779, <20> 25.3231;
param workload[JOB] := <1> 21.867, <2> 24.568, <3> 23.5516, <4> 25.7658, <5> 25.5357, <6> 23.6236, <7> 26.5121, <8> 26.7339, <9> 31.2712, <10> 26.1069, <11> 32.1564, <12> 22.9942, <13> 28.602, <14> 30.0639, <15> 24.7736, <16> 36.3581, <17> 20.5622, <18> 28.7714, <19> 13.0779, <20> 25.3231;
param capacity[MACHINE] := <1> 64.7773, <2> 64.7773, <3> 64.7773, <4> 64.7773, <5> 64.7773, <6> 64.7773;

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
