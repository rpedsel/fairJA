set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.879, <2> 11.0296, <3> 28.7137, <4> 4.5341, <5> 49.5482, <6> 42.1508, <7> 1.2978, <8> 40.3278, <9> 18.5441, <10> 32.8265, <11> 35.4786, <12> 5.3897, <13> 25.3296, <14> 39.1883, <15> 13.8278, <16> 46.7434, <17> 20.5697, <18> 24.2599, <19> 41.1961, <20> 8.6503;
param workload[JOB] := <1> 6.2353, <2> 3.3211, <3> 5.3585, <4> 2.1293, <5> 7.039, <6> 6.4924, <7> 1.1392, <8> 6.3504, <9> 4.3063, <10> 5.7294, <11> 5.9564, <12> 2.3216, <13> 5.0329, <14> 6.2601, <15> 3.7186, <16> 6.8369, <17> 4.5354, <18> 4.9254, <19> 6.4184, <20> 2.9411;
param capacity[MACHINE] := <1> 12.131, <2> 12.131, <3> 12.131, <4> 12.131, <5> 12.131, <6> 12.131;

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
