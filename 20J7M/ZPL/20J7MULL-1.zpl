set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.1353, <2> 36.6542, <3> 4.1, <4> 27.0179, <5> 29.3904, <6> 24.6601, <7> 31.1826, <8> 17.7072, <9> 33.1626, <10> 33.1302, <11> 41.3104, <12> 0.8865, <13> 17.5891, <14> 23.9651, <15> 12.0586, <16> 5.6274, <17> 30.1208, <18> 20.549, <19> 20.3676, <20> 36.3427;
param workload[JOB] := <1> 11.1353, <2> 36.6542, <3> 4.1, <4> 27.0179, <5> 29.3904, <6> 24.6601, <7> 31.1826, <8> 17.7072, <9> 33.1626, <10> 33.1302, <11> 41.3104, <12> 0.8865, <13> 17.5891, <14> 23.9651, <15> 12.0586, <16> 5.6274, <17> 30.1208, <18> 20.549, <19> 20.3676, <20> 36.3427;
param capacity[MACHINE] := <1> 65.2797, <2> 65.2797, <3> 65.2797, <4> 65.2797, <5> 65.2797, <6> 65.2797, <7> 65.2797;

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
