set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1957, <2> 19.0278, <3> 27.3528, <4> 23.1467, <5> 24.3546, <6> 23.1341, <7> 26.1269, <8> 22.0027, <9> 32.4041, <10> 23.58, <11> 22.0607, <12> 24.4288, <13> 28.5253, <14> 12.529, <15> 18.6765, <16> 18.0707, <17> 16.3814, <18> 25.6797, <19> 28.6861, <20> 17.045;
param workload[JOB] := <1> 21.3527, <2> 10.4501, <3> 3.329, <4> 11.2512, <5> 44.3969, <6> 37.065, <7> 17.1926, <8> 10.2414, <9> 24.0109, <10> 7.1643, <11> 26.0696, <12> 42.9843, <13> 4.997, <14> 1.8923, <15> 24.3952, <16> 16.5342, <17> 15.7043, <18> 10.3976, <19> 29.8519, <20> 3.1105;
param capacity[MACHINE] := <1> 45.2989, <2> 45.2989, <3> 45.2989, <4> 45.2989, <5> 45.2989, <6> 45.2989;

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
