set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.3792, <2> 14.3567, <3> 36.6901, <4> 6.2694, <5> 16.7268, <6> 46.6218, <7> 42.8293, <8> 35.0327, <9> 28.1797, <10> 43.7872, <11> 31.7536, <12> 39.9566, <13> 43.9212, <14> 17.5899, <15> 17.8436, <16> 5.4403, <17> 15.85, <18> 14.5417, <19> 29.6521, <20> 27.5425;
param workload[JOB] := <1> 3.3733, <2> 3.789, <3> 6.0572, <4> 2.5039, <5> 4.0898, <6> 6.828, <7> 6.5444, <8> 5.9188, <9> 5.3085, <10> 6.6172, <11> 5.635, <12> 6.3211, <13> 6.6273, <14> 4.194, <15> 4.2242, <16> 2.3324, <17> 3.9812, <18> 3.8134, <19> 5.4454, <20> 5.2481;
param capacity[MACHINE] := <1> 14.1217, <2> 14.1217, <3> 14.1217, <4> 14.1217, <5> 14.1217, <6> 14.1217, <7> 14.1217;

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
