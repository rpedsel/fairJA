set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0089, <2> 26.3377, <3> 25.1868, <4> 20.4663, <5> 16.7303, <6> 26.3444, <7> 29.8985, <8> 28.6923, <9> 14.8292, <10> 33.243, <11> 24.4191, <12> 23.2583, <13> 31.0017, <14> 23.8889, <15> 19.5007, <16> 27.8408, <17> 23.0952, <18> 18.8549, <19> 18.0021, <20> 20.7475;
param workload[JOB] := <1> 4.7968, <2> 5.132, <3> 5.0186, <4> 4.524, <5> 4.0903, <6> 5.1327, <7> 5.468, <8> 5.3565, <9> 3.8509, <10> 5.7657, <11> 4.9416, <12> 4.8227, <13> 5.5679, <14> 4.8876, <15> 4.416, <16> 5.2764, <17> 4.8057, <18> 4.3422, <19> 4.2429, <20> 4.5549;
param capacity[MACHINE] := <1> 12.1242, <2> 12.1242, <3> 12.1242, <4> 12.1242, <5> 12.1242, <6> 12.1242;

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
