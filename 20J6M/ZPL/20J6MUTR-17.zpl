set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4234, <2> 28.3312, <3> 17.1093, <4> 33.3121, <5> 49.8687, <6> 26.0632, <7> 17.9459, <8> 27.0692, <9> 1.3852, <10> 14.5855, <11> 41.4071, <12> 25.2143, <13> 48.608, <14> 7.9169, <15> 48.4395, <16> 39.809, <17> 43.2561, <18> 35.1747, <19> 40.4832, <20> 31.1355;
param workload[JOB] := <1> 27.4249, <2> 24.4323, <3> 37.6822, <4> 10.8943, <5> 29.0753, <6> 25.6172, <7> 14.8048, <8> 28.193, <9> 23.2337, <10> 19.9829, <11> 15.6489, <12> 9.2549, <13> 15.9473, <14> 6.3321, <15> 12.8017, <16> 16.1024, <17> 17.452, <18> 40.2412, <19> 15.8553, <20> 23.2128;
param capacity[MACHINE] := <1> 51.7736, <2> 51.7736, <3> 51.7736, <4> 51.7736, <5> 51.7736, <6> 51.7736;

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
